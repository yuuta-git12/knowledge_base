# JSONについて
##　説明
- データの定義方法の一つJSONについて記載する。

## JSONとは
- JSON→JavaScript Object Notationの略称
- JavaScriptのオブジェクトの定義をもとにしたデータ形式

## JSONの書き方
- {}の中にキーと値を転んで区切って記述する。
- キーは必ず二重引用符(ダブルクォート)で囲む、シングルクォ-トだとエラーになる
- 複数のキーと値の組みわせを記述する場合は、カンマで区切る
- 記述例
    ```json
    {"Sample":
    [
        {
        "Key1":"Value1",
        "Key2":"Value2"
        },
        {
        "Key1":"Value1",
        "Key2":"Value2"
        }
    ]
    }
    ```
    ### JSONが対応しているデータ型
    - 文字列 例：`{"name":"tanaka"}`
    - 数値　例：`{"id":1}`
    - bool値 例：`{"a":true,"b":false}`
    - オブジェクト： 
      ```json
      {
        "books":
        {
            "id":1,
            "book_name":"sankousyo",
            "price":560,
        }
      }
      ```
    - 配列： 配列を使う場合は[]で囲う。
      ```json
      {
        "books":
        [
            {
                "id":1,
                "book_name":"sankousyo",
                "price":560,
            },
            {
                "id":2,
                "book_name":"gijyutusyo",
                "price":2960,
            },
            {
                "id":2,
                "book_name":"syousetsu",
                "price":4960,
            }
        ]
      }
      ```
## JSONの使用例
- 使用したJSONファイルの中身
  ```json
  '{"id":1, 
    "name":"suzuki", 
    "attribute":{
      "gender":"male",
      "phone_number":"xxxxxxxxxxx",
      "birth":"1991/01/01"
      }
  }';
  ```
### JavaScriptでのJSONの使用例
```html
<!-- JSONのn内容をHTMLに表示するサンプル -->
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="utf-8">
        <meta name="viewpoint" content="width-device-width, initial-scale=1.0">
        <title>JSON内容表示テンプレ</title>
    </head>
    <body>
        <p id="obj_id"></p>
        <p id="obj_name"></p>
        <p id="obj_attribute_gender"></p>
        <p id="obj_attribute_phone_number"></p>
        <p id="obj_attribute_birth"></p>   
    </body>
</html>

<script>
    var json_str = '{"id":1, "name":"suzuki", "attribute":{"gender":"male", "phone_number":"xxxxxxxxxxx", "birth":"1991/01/01"}}';
    var obj = JSON.parse(json_str)
    document.getElementById("obj_id").textContent = obj.id
    document.getElementById("obj_name").textContent = obj.name
    document.getElementById("obj_attribute_gender").textContent = obj.attribute.gender
    document.getElementById("obj_attribute_phone_number").textContent = obj.attribute.phone_number
    document.getElementById("obj_attribute_birth").textContent = obj.attribute.birth
</script>


```

### PHPでのJSONの使用例
- PHPではJSONファイルの内容をオブジェクト形式と配列形式でデコードできる
- しかし、使用例のJSONファイルのようにネストされたJSONの場合は配列でデコードした場合、foreachを用いて出力する際、ネストの深さごとに処理を分ける必要が出てくる。
- 個人的にはオブジェクト形式でデコードした方が使いやすいと感じた。
```php
$json_str = '{"id":1, "name":"suzuki", "attribute":{"gender":"male", "phone_number":"xxxxxxxxxxx", "birth":"1991/01/01"}}';

// jsonをオブジェクト形式でデコードした場合
$json_obj = json_decode($json_str);
print $json_obj->id;
echo "<br>";
print $json_obj->name;
echo "<br>";
print $json_obj->attribute->gender;
echo "<br>";
print $json_obj->attribute->phone_number;
echo "<br>";
print $json_obj->attribute->birth;

// jsonを配列形式でデコードした場合(JSONがネストされているとエラーになる)
// 以下の構文だと、foreachの部分でエラーとなる
$json_array = json_decode($json_str,true);
var_dump($json_array);
foreach($json_array as $value){
    echo $value;
    echo "<br>";
}
```
 
### PythonでのJSONの使用例
- 標準ライブラリのjsonをインポートする必要がある
- jsonデータをjson.loadsで読み込むことで,pythonの辞書型に変換することができる。
```python
import json
json_data = '{"id":1, "name":"suzuki", "attribute":{"gender":"male", "phone_number":"xxxxxxxxxxx", "birth":"1991/01/01"}}'
jl = json.loads(json_data)
print(jl)

print(jl["id"])
print(jl["name"])
print(jl["attribute"]["gender"])
print(jl["attribute"]["phone_number"])
print(jl["attribute"]["birth"])

```