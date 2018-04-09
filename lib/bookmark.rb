require 'pg'

class Bookmark

  def self.all


    # begin
    #
    #       con = PG.connect :dbname => 'bookmark_manager', :user => 'louismoselhi'
    #
    #       rs = con.exec "SELECT * FROM bookmark"
    #
    #       rs.each do |row|
    #       puts "%s %s" % [ row['id'], row['url'] ]
    #       end
    #
    #   rescue PG::Error => e
    #
    #       puts e.message
    #
    #   ensure
    #
    #       rs.clear if rs
    #       con.close if con
    #
    # end

    connection = PG.connect(dbname: 'bookmark_manager')
    result = connection.exec("SELECT * FROM bookmark")
    result.map { |bookmark| bookmark['url'] }
  end

end
