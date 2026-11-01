#import data from excel file
# Install package
install.packages("readxl")

# Load the package
library(readxl)

# Import data from Excel file
Student_Marks <- read_excel("C:\\Users\\100060\\EXAM PROJECT\\Student_Marks.xlsx",
                            col_names = TRUE)

View(Student_Marks)
head(Student_Marks)
tail(Student_Marks)

# Import data from CSV file
sample <- read.csv("C:\\Users\\100060\\OneDrive - AIF Rwanda\\Isimbi, Ines\\Downloads\\sample.csv",
                   header = TRUE)

View(sample)
head(sample)
tail(sample)