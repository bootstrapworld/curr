#lang curr/lib

@title{A Guide to Editing Images}

@lesson[#:title "Finding Images"]{
@itemlist/splicing[
                   @item{Find images to start with, using your favorite search engine.}
                   @item{Try adding "filetype:gif" or "filetype:png" to your searches. If it has a transparent background to begin with, you don't have to edit one in later.}
                   @item{Using an animated gif will make the character look like it's moving.}
                   @item{Make sure that PLAYER, TARGET, and DANGER images are at least 100x100, and BACKGROUND images are at least 640x480. Trying to scale up a smaller image will result in pixelation.}]}

@lesson[#:title "Editing the Images"]{
@itemlist/splicing[@item{Using your favorite image editing software, modify images to meet the following specifications (more details on image editing below).}
                   @item{Images should be in .png or .gif formats.}
                   @item{Background images must be 640 pixels wide by 480 pixels tall.}
                   @item{Characters should generally be no longer than 150 px in either dimension.}
                   @item{Make sure that character images have transparent backgrounds.}]}


@lesson[#:title "On Windows / Linux"]{
@itemlist/splicing[@item{Download and install the program called GIMP (the GNU Image Manipulation Program) here (for Windows) or here (for Linux).}
                   @item{For the background: @itemlist[
                         @item{Open the downloaded image in GIMP.}
                         @item{If necessary, crop the image to the desired region. Select the region using the Rectangle Select tool, then drop down the Image menu, and select Crop to Selection.}
                         @item{To scale down the image: Drop down the Image menu, and select Scale Image. Change the dimensions to 640x480, clicking to break the chain icon if necessary.}
                         @item{If this distorts the image too much, undo (ctrl+z) and crop to a different shape, before sizing down again.}
                         @item{Save the image as a .gif or .png format.}]}
                   @item{For characters: @itemlist[
                         @item{Open the downloaded image in GIMP.}
                         @item{If necessary, crop the image to the desired region. Select the region using the Rectangle Select tool, then drop down the Image menu, and select Crop to Selection.}
                         @item{If necessary, scale down the image: Drop down the Image menu, and select Scale Image. Choose sizes that are between 100 and 200 in the longest dimension.}
                         @item{To introduce a transparent background, drop down the Layer menu, hover over Transparency, and select Add Alpha Channel.}
                         @item{For images with a solid color background: @itemlist[
                                                                                   @item{Click the Select by Color tool.}
                                                                                   @item{In the image, click on the background that you wish to remove, to select it.}
                                                                                   @item{Then press the Delete key to remove it. You should see a checkered background.}]}
                         @item{For images with a multi-colored background: @itemlist[
                                                                                   @item{Click the Scissor Select tool.}
                                                                                   @item{Going around the character that you wish to select, click as though you were creating a "connect the dots" around the foreground. Be sure that you start and end at the same place. If needed, drag the dots to bettter include your image.}
                                                                                   @item{Press enter, to select the desired region.}
                                                                                   @item{Drop down the Select menu, and click Invert, to select only the background.}
                                                                                   @item{Press the Delete key to remove that background. You should see a checkered background.}]}
                         @item{Save the image as a .gif or .png format. Be sure to uncheck the options for "Save background color" and "Save color value for transparent pixels".}]
                    
                    }]}

@lesson[#:title "On a Mac"]{
@itemlist/splicing[@item{}]}

@copyright[]

