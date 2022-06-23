# Library Schema
Key: 
- **bold** = primary key
- *italic* = foreign key
- '<--' = 'depends on'

## 1NF
### Library (Book)
- **ISBN**
- Title
- Author
- Format
- Pages
- Publisher
- Edition
- Year

---

## 2NF
ISBN <-- Title, Author
Publisher <-- Edition, Year
Format <-- Pages, Duration

### Book
- **ISBN**
- Title
- Author

### Book_Information
- ***ISBN***
- Year
- Edition
- Publisher

### Book_Format
- ***ISBN***
- Format
- File Type
- Pages
- Duration

---

## 3NF

### Book
- **ISBN**
- Title
- Author  

### Book_Information
- ***ISBN***
- Year
- Edition
- Publisher 

Author <-- First Name, Middle Name, Last Name, Post-Nominal

### Author
- **Author_Id**
- First_Name
- Middle_Name
- Last_Name
- Post_Nominal  

Format <-- File Type, Pages, Duration

### Physical_Book
- ***ISBN***
- Cover (i.e. hardcover or paperback)
- Pages
- Duration

### Electronic_Book
- ***ISBN***
- File Type (i.e. PDF, EPUB, etc)
- Pages

### Audio_Book
- ***ISBN***
- File Type
- Duration
- Narrator 
