package com.m520it.library.bean;

public class ShoppingCart {
    private Integer id;

    private String author;

    private String bookname;

    private String imageadress;

    private String isbn;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname == null ? null : bookname.trim();
    }

    public String getImageadress() {
        return imageadress;
    }

    public void setImageadress(String imageadress) {
        this.imageadress = imageadress == null ? null : imageadress.trim();
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn == null ? null : isbn.trim();
    }
}