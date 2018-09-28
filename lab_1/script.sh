

#!/bin/sh
print_menu() {
        echo "---------------------------------------------"
        echo "                M E N U                      "
        echo "---------------------------------------------"
        echo "Выберите редатор для запуска:"
        echo "1 Напечатать имя текущего каталога"
        echo "2 Напечатать содержимое текущего каталога"
        echo "3 Создать каталог"
        echo "4 Предоставить всем право на запись в каталог"
        echo "5 Убрать всем право на запись в каталог"
        echo "6 Выйти из программы"
}

read_options(){
        echo "\nВыбери нужный номер "
        read doing

        case $doing in
                1) basename $(pwd) ;;
                2) ls ;;

                3) echo "Введите имя новой директории."
                   read name
                   mkdir "$name" 2>lab1_err
                   cat ./lab1_err ;;
                4) chmod a+w . ;;
                5) chmod a-w . ;;
                6) exit 0 ;;
                *) echo "Такого пункта нет! Выберите корректный номер."
        esac
}

while true
do
        print_menu
        read_options
done
