# Quering data using GraphhQL in Comment Tree App

## Query

### Comment

> **Fetch list of comments with responses**

```
query {
  comments
  {
    id
    responses {
      id
      text
        responses {
          id
          text
        }
    }
  }
}

```

> **Fetch single comment**

```
query {
  comment(id: 57) {
    id
    text
    responses {
      id
      text
    }
  }
}
```

> **Fetch list of users**

```
query {
  users {
    id
    fullName
    email
  }
}
```

### User

> **Fetch single user**

```
query {
  user(id: 1) {
    id
    fullName
    email
  }
}
```

---

## Mutations

### Comment

> **Create Comment**

```
mutation {
  createComment(input: {
    text: "Hello, how are you doing?",
    parentId: 53
  }) {
    comment {
      id
      text
      parentId
    }
    
    errors
  }
}
```
> **Update Comment**

```
mutation {
  updateComment(input: {
    id: 58,
    text: "Hello, how do you do?"
  }) {
    comment {
      id
      text
      parentId
    }
    
    errors
  }
}
```
> **Delete Comment**

```
mutation {
  deleteComment(input: {
    id: 58
  }) {
    comment {
      id
      text
      parentId
    }
    
    error
  }
}
```

### User

> **Create User**

```
mutation {
  createUser(input: {
    firstName:"Shehroz",
    lastName:"Irfan",
    email:"shehrozirfan90@gmail.com",
    password:"Foobar@123"
  })  {
    user {
      fullName
      email
    }
    errors
  }
}
```

> **Update User**

```
mutation {
  updateUser(input: {
    id: 3,
    firstName:"Sh",
    lastName:"Irfan",
  })  {
    user {
      id
      fullName
      email
    }
    errors
  }
}
```

> **Delete User**

```
mutation{
  deleteUser(input: {id: 3}) {
    user {
      id
      fullName
    }
    error
  }
}
```
