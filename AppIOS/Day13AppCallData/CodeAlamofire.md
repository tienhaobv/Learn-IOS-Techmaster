Swift 5 and Alamofire 5 version:

```swift
  import Alamofire

  func makeGetCallWithAlamofire() {
    let todoEndpoint: String = "https://jsonplaceholder.typicode.com/todos/1"
    AF.request(todoEndpoint)
      .responseJSON { response in
        // check for errors
        guard response.error == nil else {
          // got an error in getting the data, need to handle it
          print("error calling GET on /todos/1")
          print(response.error!)
          return
        }

        // make sure we got some JSON since that's what we expect
        guard let json = response.value as? [String: Any] else {
          print("didn't get todo object as JSON from API")
          if let error = response.error {
            print("Error: \(error)")
          }
          return
        }

        // get and print the title
        guard let todoTitle = json["title"] as? String else {
          print("Could not get todo title from JSON")
          return
        }
        print("The title is: " + todoTitle)
    }
  }

  func makePostCallWithAlamofire() {
    let newTodo: [String: Any] = ["title": "My First Post", "completed": 0, "userId": 1]
    AF.request(TodoRouter.create(newTodo))
      .responseJSON { response in
        guard response.error == nil else {
          // got an error in getting the data, need to handle it
          print("error calling POST on /todos/1")
          print(response.error!)
          return
        }
        // make sure we got some JSON since that's what we expect
        guard let json = response.value as? [String: Any] else {
          print("didn't get todo object as JSON from API")
          if let error = response.error {
            print("Error: \(error)")
          }
          return
        }
        // get and print the title
        guard let idNumber = json["id"] as? Int else {
          print("Could not get id number from JSON")
          return
        }
        print("Created todo with id: \(idNumber)")
    }
  }

  func makeDeleteCallWithAlamofire() {
    let firstTodoEndpoint: String = "https://jsonplaceholder.typicode.com/todos/1"
    AF.request(firstTodoEndpoint, method: .delete)
      .responseJSON { response in
        guard response.error == nil else {
          // got an error in getting the data, need to handle it
          print("error calling DELETE on /todos/1")
          if let error = response.error {
            print("Error: \(error)")
          }
          return
        }
        print("DELETE ok")
    }
  }
```