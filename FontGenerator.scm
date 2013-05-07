(define (script-fu-xytext-simple inText inFont inFontSize inTextColor)
   (let*
       (
       ; define our local variables
       ; create a new image:
       (theImageWidth  512)
       (theImageHeight 512)
       (theImage)
       (theLayer )
       (x 0)
       (y 0)
       (p 32)
       (theText)
       (rows #(
               " !\"#$%&'()"
               "*+,-./0123"
               "456789:;<="
               ">?@ABCDEFG"
               "HIJKLMNOPQ"
               "RSTUVWXYZ["
               "\\]^_`abcde"
               "fghijklmno"
               "pqrstuvwxy"

               ;"z{|}~·thetaOmegaRadix.o "
               (list #\z #\{ #\| #\} #\~ #x387 #x3F4 #x3A9r #x221A #x387 )
              )
       )
       (el 0)
       (ch 0)
       ) ;end of our local variables

  ; builds image
  (set! theImage (car    (gimp-image-new theImageWidth theImageHeight RGB)))
  ; builds layer
  (set! theLayer (car (gimp-layer-new theImage theImageWidth theImageHeight RGB-IMAGE "layer 1" 100 NORMAL) ) )
  ; add layer to image
  (gimp-image-add-layer theImage theLayer 0)

  ; add alpha and set foreground
  (gimp-layer-add-alpha theLayer)
  (gimp-palette-set-foreground inTextColor)

  ; clear all the image and remove selection
  (gimp-selection-all theImage)
  (gimp-edit-clear theLayer)
  (gimp-selection-none theImage)

  ; do actual plot of characters
  (while (< x 10)
    (while (< y 10)
      (set! el (vector-ref rows x))
      (set! ch (if (string? el) (substring el y (+ y 1)) (list-ref el (+ y 1))))
      (if (integer? ch) (set! ch (integer->char ch)))
      (if (char? ch)(set! ch (string ch)))
      (set! p ch)
      (set! theText (car (gimp-text-fontname theImage theLayer
          (+ (* y 51.2) 12) (- (* x 51.2) 7)
          p    0    TRUE
          inFontSize PIXELS
          inFont)))

        ; go on next char
        ;(set! p (+ p 1))
        (set! y (+ y 1))
      )

    (set! y 0)
    (set! x (+ x 1))
  )

  ; apply the layers (apply transparence
  (gimp-image-merge-visible-layers theImage 0)

  (gimp-display-new theImage)
  )
)

(script-fu-register
  "script-fu-xytext-simple"           ;func name
  "XYText-simple"                     ;menu label
  "Generate font for xytext-simple"   ;description
  "Salahzar Stenvaag"                 ;author
  "copyright 2008, Salahzar Stenvaag" ;copyright notice
  "October 27, 1997"                  ;date created
  ""                                  ;image type that the script works on
  SF-STRING      "Text:"         "Text Box"           ;a string variable
  SF-FONT        "Font:"         "Andale Mono"        ;a fixed font variable
  SF-ADJUSTMENT  "Font size"     '(50 1 1000 1 10 0 1);a spin-button
  SF-COLOR       "Color:"        '(255 255 255)       ;color variable
)

(script-fu-menu-register "script-fu-xytext-simple" "<Toolbox>/Xtns/Text")