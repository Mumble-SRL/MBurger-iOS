# MBAdmin

In the MBAdmin package you can find the function toedit the sections of MBurger.
You will have to use a token with write permission to edit the sections and with delete permission to delete them.

# Add/Edit a section

You can add a section to a block with the function `[MBAdmin addSectionToBlockWithBlockId:Elements:Success:Failure:]`. To call this function you need to create an array of `MBUploadableElement` objects. You should create it using the `MBUploadableElementsFactory` class that is created to this purpose. An MBUploadableElementsFactory is allocateed with a locale identifier and creates object with this locale identifier. All the integrity controls of the server are still present in the APIs, you will find the description of the error in the object passed to the failure block. Below an example code to create a section. 

**Objective-C**:

```objective-c
MBUploadableElementsFactory *factory = [[MBUploadableElementsFactory alloc] initWithLocaleIdentifier:@"it"];
NSArray *elements = @[[factory textElementWithName:@"title" Text:@"The title", [factory imagesElementWithName:@"image" Image:[UIImage imageNamed:@"test_image"]]]];
[MBAdmin addSectionToBlockWithBlockId:BLOCK_ID Elements:elements Success:^{
        
} Failure:^(NSError *error) {
        
}];
```

**Swift**:

```swift
let factory = MBUploadableElementsFactory(localeIdentifier: "it")
let elements = [factory.textElement(withName: "title", text: "The title"), factory.imagesElement(withName: "image", image: UIImage.init(named: "Test"))]
MBAdmin.addSectionToBlock(withBlockId: 1, elements: elements, success: {

}, failure: { (error) in
            
})          
```

With a `MBUploadableElementsFactory` you can create an image/file element with a single image/file or with an array of images/files it creates a `MBUploadableImagesElement`/`MBUploadableFilesElement` in both cases.

The edit function is very similar to the add. It will modifiy only the fields passed and the other elements will remain untouched.

# Delete a section

To delete a section with an id:

**Objective-C**:

```objective-c
[MBAdmin deleteSectionWithSectionId:SECTION_ID Success:^{
        
} Failure:^(NSError *error) {
        
}];
```
**Swift**:

```swift
MBAdmin.deleteSection(withSectionId: SECTION_ID, success: {
}, failure: { (error) in

            
})

```


# Delete a media

You can delete a media (an image or a video), giving its id. with the function. The id of the media is the field id of the objects `MBImage` and `MBFile`.

**Objective-C**:

```objective-c
[MBAdmin deleteMediaWithMediaId:MEDIA_ID Success:^{
        
} Failure:^(NSError *error) {
        
}];
```

**Swift**:

```swift
MBAdmin.deleteMedia(withMediaId: MEDIA_ID, success: {
            
}, failure: { (error) in
            
})
```
