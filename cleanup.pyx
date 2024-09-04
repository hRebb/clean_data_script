import csv

def clean_data(input_file: str, output_file: str):
    with open(input_file, 'r', encoding='utf-8') as infile, open(output_file, 'w', encoding='utf-8', newline='') as outfile:
        reader = csv.reader(infile)
        writer = csv.writer(outfile)
        
        for row in reader:
            cleaned_row = [item.strip() for item in row]
            writer.writerow(cleaned_row)

def verify_cleaned_data(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        reader = csv.reader(file)
        for row in reader:
            for item in row:
                if item != item.strip():
                    print(f"Erreur : L'élément '{item}' n'a pas été correctement nettoyé.")
                    return False
    print("Le fichier a été correctement nettoyé.")
    return True