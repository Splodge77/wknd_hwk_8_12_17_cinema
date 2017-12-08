require('pg')

class SqlRunner

  def self.run(sql,values = [])
      db = PG.connect(dbname: 'cinema', host: 'localhost')
      db.prepare('query', sql)
      result = db.exec_prepared('query', values)
      db.close if db != nil
    return result
  end

end
