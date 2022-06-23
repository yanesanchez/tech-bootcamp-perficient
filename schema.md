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

Format <-- File Type, Pages, Duration

### Traditional_Book
- ***ISBN***
- Format
- File Type
- Pages
- Duration

### Electronic_Book
- ***ISBN***
- File Type
- Pages

### Audio_Book
- ***ISBN***
- File Type
- Duration
- Narrator 
