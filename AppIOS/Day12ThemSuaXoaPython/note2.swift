Alamofire.request("http://0.0.0.0:8000/").responseJSON { response in  //Đây là khai báo closure. Closure khác gì một method, functioon bình thường
            print("json")
            switch response.result {
            case .success(let value):
                self.json = JSON(value)
                print("Number of records \(self.json!.count)")
                print("JSON: \(self.json![0])")
                
                for (_, record) in self.json! {
                    print(record["ID"])
                }
                self.tableView.reloadData()  //Reload lại tableview khi có dữ liệu mới
            case .failure(let error):
                print(error)
            }
        }