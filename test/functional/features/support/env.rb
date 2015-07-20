$LOAD_PATH << File.dirname(__FILE__)+'/../page_objects'
require 'rubygems'
require 'page-object'
require 'active_record'

$LOAD_PATH << File.dirname(__FILE__) + '/activerecord-jdbcmysql-adapter'

HOST_AND_PORT = 'http://localhost:8080'

def blog_url
  "#{HOST_AND_PORT}/grails-blog/"
end