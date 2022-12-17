## Quering data using GraphhQL in Comment Tree App

### Query

#### Get Comments

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

#### Get a comment with given `id`

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

#### Get Users

```
query {
  users {
    id
    fullName
    email
  }
}
```

#### Get a user with given `id`

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

#### Create a comment

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

#### Update a comment

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

#### Delete a Comment

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
