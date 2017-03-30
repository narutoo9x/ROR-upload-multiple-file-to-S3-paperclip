### Upload Multiple file to S3 using Paperclip

- POST:  localhost:3000/items

````
{
  "item": {
    "name": "beautiful item",
    "description": "beautiful beautiful beautiful beautiful",
    "image_base": "data:image/jpeg;base64,/9j/4AAQSkB...",
    "document_data": [ "data:application/pdf;base64, IB6gGiiigAooo ...", "data:application/pdf;base64, CiiigAoooo ..."]
  }
}
````
