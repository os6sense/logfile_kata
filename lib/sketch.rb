urls = Hash.new { |h, k| h[k] = [] }

filename = ARGV[0]

File.open(filename, 'r').each_line do | line |
  line.split(" ").tap { | url, ip | urls[url] << ip }
end

# pages by most visited
urls.sort_by { | k, v | v.count }.each { |k, v| puts "#{k} #{v.count} visits" }

puts "==========++"
urls.sort_by { | k, v | v.uniq.count }.each { |k, v| puts "#{k} #{v.uniq.count} unique views" }
