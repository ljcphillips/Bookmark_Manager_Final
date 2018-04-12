require 'pg'

def fill_data
  connection = PG.connect(dbname: 'bookmark_manager_test')

  # Add the test data
  connection.exec("INSERT INTO bookmark (url, title) VALUES('http://makersacademy.com', 'Makers');")
  connection.exec("INSERT INTO bookmark (url, title) VALUES('http://destroyallsoftware.com', 'DAS');")
  connection.exec("INSERT INTO bookmark (url, title) VALUES('http://google.com', 'Google');")
end
