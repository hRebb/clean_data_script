from cleanup import clean_data, verify_cleaned_data

input_file = 'final_scrape_cars45.csv'
output_file = 'cleaned_data.csv'

clean_data(input_file, output_file)
verify_cleaned_data(output_file)