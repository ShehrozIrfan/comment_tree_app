## Quering data using GraphhQL in Comment Tree App

### Query

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

### Mutations

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
