namespace :enju_inventory do
  namespace :item do
    desc "Import inventory result"
    task :import, ['path'] => :environment do |task, args|
      CSV.foreach(args['path'], headers: true, col_sep: "\t") do |row|
        # 電子書籍を除外
        next if row['shelf'] == 'web'

        case row['circulation_status']
        when 'On Loan'
          # 書架にないと報告されたが、確認したら貸出中の場合、不明日を削除
          item = Item.find_by(item_identifier: row['item_identifier'])
          if item.missing_since.present?
            item.update!(missing_since: nil)
            puts "rent: #{row['item_identifier']}"
          end
        when 'Available On Shelf'
          # 書架にないと報告されたが、確認したら書架にあった本を「利用可能」に変更
          if row['current_shelf'] == '-' or row['current_shelf'].blank?
            item = Item.find_by(item_identifier: row['item_identifier'])
            if item.missing_since.present? && !item.rent?
              item.update!(missing_since: nil, circulation_status: CirculationStatus.find_by(name: row['circulation_status']))
              puts "wrong: #{row['item_identifier']}"
            end
          end

          # 発見された不明本の状態を変更
          unless row['current_shelf'] == '-' or row['current_shelf'].blank?
            if row['missing_since'].present?
              item = Item.find_by(item_identifier: row['item_identifier'])
              if item.rent?
                item.update!(missing_since: nil)
              else
                item.update!(
                  missing_since: nil,
                  circulation_status: CirculationStatus.find_by(name: row['circulation_status'])
                )
              end
              puts "found: #{row['item_identifier']}"
            end
          end
        when 'Missing'
          if row['missing_since'].blank?
            item = Item.find_by(item_identifier: row['item_identifier'])
            item.update!(missing_since: Date.today)
          end
        end

        # 配架場所の変更を反映
        unless row['current_shelf'] == row['shelf']
          unless row['current_shelf'] == '-' or row['current_shelf'].blank?
            item = Item.find_by(item_identifier: row['item_identifier'])
            shelf = Shelf.find_by(name: row['current_shelf'])
            if item && shelf
              item.update!(shelf: Shelf.find_by(name: row['current_shelf']))
              puts "changed: #{row['item_identifier']}"
            end
          end
        end
      end
    end
>>>>>>> aa9f7a5... add missing_since to Item
  end
end
