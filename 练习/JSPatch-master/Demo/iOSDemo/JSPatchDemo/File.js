defineClass('JPViewController', {
            handleBtn: function(sender) {
            var testiewCtrl = TestViewController.alloc().init()
            self.navigationController().pushViewController_animated(testiewCtrl, YES)
            }
            })
defineClass('TestViewController',
{

createDataSource:function(){
            require('NSMutableArray');
            var arr = NSMutableArray.alloc().init();
            
            require('NSString');
            for (var i = 0; i < 30; i++) {
            arr.addObject(NSString.stringWithFormat("Hello tableview: %d", i));
            }
            self.setValue_forKey(arr, "_data")
      //从oc传值到jspatch
            self.request(block("NSString *,BOOL",
                          function(ctn,succ)
                          { if(succ)
                          console.log(ctn)
                          }
                          ))
      //从js 传值到oc
            var blk=self.genBlock();
            blk({v:"0.001"});
            
},

//    require('UIView,UIColor,UILabel,UITableView')
//    var testview=UIView.alloc().initWithFrame({x:0,y:64,width:self.view().bounds().width,height:40})
//    var redColor=UIColor.redColor();
//            var lable=UILabel.alloc().initWithFrame({x:0,y:0,width:200,height:20})
//    lable.setText("you are the evevrything")
//    lable.setTextColor(UIColor.whiteColor())
//    testview.setBackgroundColor(redColor)
//    self.view().addSubview(testview)
//    testview.addSubview(lable)
//   self.tableview=UITableView.alloc().initWithFrame.({})
//   self.tableview.setDelegate(self);
//   self.tableview.setDataSource(self);
 
            


})