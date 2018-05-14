# NKAdmin

In the NKAdmin package you can find the function toedit the sections of Nooko.
You will have to use a token with write permission to edit the sections and with delete permission to delete them.

# Add/Edit a section

You can add a section to a block with the function `[NKAdmin addSectionToBlockWithBlockId:Elements:Success:Failure:]`. To call this function you need to create an array of `NKUploadableElement` objects. You should create it using the `NKUploadableElementsFactory` class that is created to this purpose. An NKUploadableElementsFactory is allocateed with a locale identifier and creates object with this locale identifier. All the integrity controls of the server are still present in the APIs, you will find the description of the error in the object passed to the failure block. Below an example code to create a section. 

**Objective-C**:

```
NKUploadableElementsFactory *factory = [[NKUploadableElementsFactory alloc] initWithLocaleIdentifier:@"it"];
NSArray *elements = @[[factory textElementWithName:@"title" Text:@"The title", [factory imagesElementWithName:@"image" Image:[UIImage imageNamed:@"test_image"]]]];
[NKAdmin addSectionToBlockWithBlockId:BLOCK_ID Elements:elements Success:^{
        
} Failure:^(NSError *error) {
        
}];
```

**Swift**:

```
let factory = NKUploadableElementsFactory(localeIdentifier: "it")
let elements = [factory.textElement(withName: "title", text: "The title"), [factory.imagesElement(withName: "image", image: UIImage.init(named: "Test"))]]
NKAdmin.addSectionToBlock(withBlockId: 1, elements: elements, success: {

}, failure: { (error) in
            
})          
```

With a `NKUploadableElementsFactory` you can create an image/file element with a single image/file or with an array of images/files it creates a `NKUploadableImagesElement`/`NKUploadableFilesElement` in both cases.

The edit function is very similar to the add. It will modifiy only the fields passed and the other elements will remain untouched.

# Delete a section

To delete a section with an id:

**Objective-C**:

```
[NKAdmin deleteSectionWithSectionId:SECTION_ID Success:^{
        
} Failure:^(NSError *error) {
        
}];
```
**Swift**:

```
NKAdmin.deleteSection(withSectionId: SECTION_ID, success: {
}, failure: { (error) in

            
})

```


# Delete a media

You can delete a media (an image or a video), giving its id. with the function. The id of the media is the field id of the objects `NKImage` and `NKFile`.

**Objective-C**:

```
[NKAdmin deleteMediaWithMediaId:MEDIA_ID Success:^{
        
} Failure:^(NSError *error) {
        
}];
```

**Swift**:

```
NKAdmin.deleteMedia(withMediaId: MEDIA_ID, success: {
            
}, failure: { (error) in
            
})
```
