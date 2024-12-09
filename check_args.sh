# задание 1
nano one_one.sh
#!/bin/bash
   if [ "$#" -ne 2 ]; then
       echo "Использование: $0 -u/-l слово"
       exit 1
   fi
   argument=$1
   word=$2
   case $argument in
       -u)
           echo "${word^^}"  # очень сложна
           ;;
       -l)
           echo "${word,,}"  
           ;;
       *)
           echo "Неверный аргумент. Используйте -u для заглавных или -l для строчных."
           exit 1
           ;;
   esac
chmod +x change_case.sh
./change_case.sh -u "помогите"
   

# задание 2
nano two_two.sh
   #!/bin/bash
   # Поддерживаемые форматы
   supported_formats=("txt" "pdf" "doc")
   # Функция для проверки формата
   function is_supported() {
       local ext=$1
       for format in "${supported_formats[@]}"; do
           if [[ "$ext" == "$format" ]]; then
               return 0
           fi
       done
       return 1
   }
   # Проверка количества аргументов
   if [ "$#" -ne 3 ]; then
       echo "Использование: $0 <путь до файла> <текущее расширение> <новое расширение>"
       exit 1
   fi
   file_path=$1
   current_ext=$2
   new_ext=$3
   # Проверка форматов
   if ! is_supported "$current_ext"; then
       echo "Ошибка: текущее расширение '$current_ext' не поддерживается."
       echo "Поддерживаемые форматы: ${supported_formats[*]}"
       exit 1
   fi

   if ! is_supported "$new_ext"; then
       echo "Ошибка: новое расширение '$new_ext' не поддерживается."
       echo "Поддерживаемые форматы: ${supported_formats[*]}"
       exit 1
   fi
   # Проверка существования файла
   if [ ! -f "$file_path" ]; then
       echo "Ошибка: файл '$file_path' не найден."
       exit 1
   fi
   # Изменение расширения файла
   new_file_path="${file_path%.*}.$new_ext"
   mv "$file_path" "$new_file_path"

   echo "Расширение файла изменено на '$new_ext'. Новый путь: '$new_file_path'."
   
chmod +x two_two.sh
./two_two.sh "/path/to/file.txt" "txt" "pdf"
   
# задание 3
if [ "$#" -ne 3 ]; then
    echo "Ошибка: необходимо ввести ровно 3 аргумента."
else
    echo "Начинаем обработку с аргументами: $1, $2, $3"
fi
