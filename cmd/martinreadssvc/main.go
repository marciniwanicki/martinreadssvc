package main

import (
    "github.com/gin-gonic/gin"
    "net/http"
)

type User struct {
    ID   int    `json:"id"`
    Name string `json:"name"`
}

func main() {
    r := gin.Default()

    r.GET("/user", func(c *gin.Context) {
        user := User{ID: 1, Name: "Alice"}
        c.JSON(http.StatusOK, user)
    })

    r.Run(":8080")
}
