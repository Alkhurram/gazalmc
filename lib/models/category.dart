class Category{
int categoryid;
String categoryName;
String categoryDes;
int parent;
Images image;

Category({
this.categoryid,
this.categoryName,
this.categoryDes,
this.parent,
this.image,

});
Category.fromjosn(Map<String,dynamic> json){
categoryid=json['id'];
categoryName=json['name'];
categoryDes=json['description'];
parent=json['parent'];
image=json['image']!=null ? new Images.fromJson(json['image']):null;  
}

}





class Images{


  String url;
Images({

  this.url,
});
  Images.fromJson(Map<String,dynamic>json){

    url=json['src'];
  }
}