# ex_redasterix

** WARNING: This project is compiled using Genero 3.10. **

Example code that shows some techniques of how you can automatically indicate fields are mandatory, and the strengths and weaknesses of each approach

It uses ui.Form.setDefaultInitializer to call a function every time a form is loaded and manipulates the AUI Tree

Approaches include ...

* Appending a red asterix to the right of every field that is mandatory.  A strength of this approach is that this will work with all widgets.  A weakness is that something different would be required for tables.  This would typically consist of adding * into the column header but this would not currently be able to be red.  The biggest weakness of this apporach is that the effect this has on form geometry.  For tightly packed forms, it is possible the red asterix would overlay adjacent widgets or text.  The solution of this is to always code your forms with a blank space to the right of the widget, if you have to do that you may as well add the asterix yourself...

<p align="center">
<img alt="Red Asterix Screenshot" src="https://user-images.githubusercontent.com/13615993/27722007-9ace9886-5db8-11e7-912b-0fd3ae978f5a.png" width="400" />
</p>


* Adding a style to indicate that a field is mandatory.  A strength of this approach is that it does effect the geometry.  A weakness is that it is not suitable for all GUI widgets.  For instance a COMBOBOX maynot allow you to change the background colour.  If we had access to more GUI properties such as backgroundImage or border colour, then this approach might come into play more.

<p align="center">
<img alt="Style Screenshot" src="https://user-images.githubusercontent.com/13615993/27722006-9aca150e-5db8-11e7-8556-0f330f466bba.png" width="400" />
</p>

* Using the new PLACEHOLDER attribute to indicate that the field is mandatory.  A strength of this approach is that it does not effect the geometry and the placeholder disappears if the user types a value into the field.  A weakness is that it is not suitable for GUI widgets such as CHECKBOX, COMBOBOX, RADIOGROUP.  A counter argument would be that those widgets have their own way of indicating if nulls are allowed

<p align="center">
<img alt="Placeholder Screenshot" src="https://user-images.githubusercontent.com/13615993/27722004-9ac6c872-5db8-11e7-8f97-39775cfe369a.png" width="400" />
</p>
