# coding: utf-8
#Программа имитирует магический шар. Загадай свой ворос и просто запусти программу.
#Магический шар не заставит долго ждать ответ...

#Устанавливаем правильную кодировку в Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

#Текущая директория с программой
current_path = File.dirname(__FILE__)

#Пути для фалов с данными
file_answers = current_path + "/data/answers.txt"
file_greetings = current_path + "/data/greetings.txt"

#Считываем файлы с данными и проверяем их наличие
begin
  answers = File.readlines(file_answers, chomp: true, encoding: 'UTF-8')
  greetings = File.readlines(file_greetings, chomp: true, encoding: 'UTF-8')
rescue SystemCallError  #Errno::ENOENT
  abort "Не удалось открыть файл с данными"
end

#Выводим приветствие и ответ на вопрос
puts greetings.sample
puts

sleep 2

puts answers.sample
