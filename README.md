# Comment Tree App
- Comment tree app is a simple commenting app. In which a comment can have many `responses/replies`, making it a tree of comments, that's why it is named as `Comment Tree`
- The concept of `self-referential classes` is used, to implement this `Comment Tree`
- For the `Authorization` and `Authentication`, `devise` is used
- A `User` can apply `CRUD` operation on the `Comments`
- For `User` image, `active storage` is used
- For test cases, `rspec` is used

## Features
- To be added

## How to contribute
Visit [CONTRIBUTING.md](https://github.com/ShehrozIrfan/comment_tree_app/blob/master/CONTRIBUTING.md) for contribution to this project.

## How to Learn
Visit [LEARN.md](https://github.com/ShehrozIrfan/comment_tree_app/blob/master/LEARN.md) for learning `self-referential associations` and how it works in Ruby on Rails.

## Work with GQL
- Made sure you've started the server using: `rails s`
- Access the playground on link: `http://localhost:3000/graphiql`
- To get help about quering data using GQL in comment tree app, follow [GRAPHQL.md](https://github.com/ShehrozIrfan/comment_tree_app/blob/master/GRAPHQL.md)


## Setup Details

### Ruby version
- `ruby 2.4.1`
- Bundled with: `2.3.7`

### Setting up storage for images
In this project, I've used the AWS S3 Bucket for storing the `user` images. If you want the same functionality then you need to create your own S3 Bucket and add the required/relevant keys OR you can just set the storage to `local`. It is important to set this up for your local machine, otherwise you might face errors while `sign_up` or other places.

- #### Local Storage
  - Go to `config/environments/development.rb` file and for the line: `config.active_storage.service = :amazon_dev` replace `:amazon_dev` with `:local`.
  - Like it will be: `config.active_storage.service = :local`
  - Restart the server and it will work on local storage

- #### Setting up S3 Bucket
  - Make sure to create your own bucket on S3 or you can follow this [Link](https://medium.com/@rmg007/rails-6-0-upload-images-using-active-storage-and-amazon-simple-storage-service-amazon-s3-36861c03dc4a) for guidance on creating your S3 Bucket and connect it to the App.
  - Create your credentials file using: `EDITOR="code --wait" bin/rails credentials:edit`
  - Add the credentials: 
 
    ``` 
      aws:
        access_key_id: "XXXX"
        secret_access_key: "XXXX"
        region: "us-east-1"
        dev:
          bucket: "BUCKET-NAME-DEV"
        prod:
          bucket: "BUCKET-NAME-PROD"
     ```
  - Go to `config/environments/development.rb` file and for the line: `config.active_storage.service = :local` replace `:local` with `:amazon_dev`.
  - Like it will be: `config.active_storage.service = :amazon_dev`
  - Restart the server and it will work

### Database creation
To setup the database for this project follow the steps below:
- `rails db:create`
- `rails db:migrate`

If you ran into issues, follow:
- `rails db:drop`
- `rails db:create`
- `rails db:migrate`

### Seed Database
To populate the database with some data use:
`rails db:seed`

### Starting the server
- To start the server use: `rails s`.
- You can see the application running on: `http://localhost:3000/`

### How to run the test suite
- For the test cases `rspec` is used.
- To run the test cases, run the command: `rspec`
- To run the test cases for a specific file, run the command: `rspec file_path`

### System dependencies
- To be added

### Configuration
- To be added

### Database initialization
- To be added

### Services (job queues, cache servers, search engines, etc.)
- To be added

### Deployment instructions
- To be added
