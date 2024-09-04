import csv

def clean_data(str input_file, str output_file):
    cdef:
        object infile
        object outfile
        object reader
        object writer
        list row
        list cleaned_row
        str item

    infile = open(input_file, 'r', encoding='utf-8')
    outfile = open(output_file, 'w', encoding='utf-8', newline='')

    reader = csv.reader(infile)
    writer = csv.writer(outfile)

    for row in reader:
        cleaned_row = [item.strip() for item in row]
        writer.writerow(cleaned_row)

    infile.close()
    outfile.close()

def verify_cleaned_data(str file_path):
    cdef:
        object file
        object reader
        list row
        str item

    file = open(file_path, 'r', encoding='utf-8')
    reader = csv.reader(file)

    for row in reader:
        for item in row:
            if item != item.strip():
                print(f"Erreur : L'élément '{item}' n'a pas été correctement nettoyé.")
                file.close()
                return False

    print("Le fichier a été correctement nettoyé.")
    file.close()
    return True