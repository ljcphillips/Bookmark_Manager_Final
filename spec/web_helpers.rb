require 'pg'

def fill_data
  connection = PG.connect(dbname: 'bookmark_manager_test')

  # Add the test data
  connection.exec("INSERT INTO bookmark VALUES(1, 'http://makersacademy.com');")
  connection.exec("INSERT INTO bookmark VALUES(2, 'http://destroyallsoftware.com');")
  connection.exec("INSERT INTO bookmark VALUES(3, 'http://google.com');")
end
