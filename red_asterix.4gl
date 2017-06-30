PUBLIC DEFINE mandatory_mode INTEGER

FUNCTION form_init(f)
DEFINE f ui.Form

DEFINE grid_list, formfield_list om.NodeList
DEFINE form_node, grid_node, formfield_node, widget_node, star_node om.DomNode
DEFINE i,j INTEGER
DEFINE star_x, star_y INTEGER

    LET form_node = f.getNode()
    LET grid_list = form_node.selectByTagName("Grid")
    FOR i = 1 TO grid_list.getLength()
        LET grid_node = grid_list.item(i)
        LET formfield_list = grid_node.selectByTagName("FormField")
        FOR j = 1 TO formfield_list.getLength()
            LET formfield_node = formfield_list.item(j)
            -- Mandatory defined as NOT NULL
            IF formfield_node.getAttribute("notNull") = 1 THEN
                LET widget_node = formfield_node.getFirstChild()
                CASE mandatory_mode
                    WHEN 1 -- Approach One, add a red asterix
                        LET star_node = grid_node.createChild("Label")
                        LET star_y = widget_node.getAttribute("posY")
                        CALL star_node.setAttribute("posY", star_y)
                
                        LET star_x = widget_node.getAttribute("posX")+widget_node.getAttribute("gridWidth")+1
                        CALL star_node.setAttribute("posX", star_x)
                        CALL star_node.setAttribute("width", 1)
                        CALL star_node.setAttribute("height", 1)
                        CALL star_node.setAttribute("text", "*")
                        CALL star_node.setAttribute("style", "red_asterix")
                        
                    WHEN 2 -- Approach two, set background color via styles
                        CALL widget_node.setAttribute("style","mandatory")

                    WHEN 3 -- Approach 3, use placeholder
                        IF widget_node.getTagName() ! = "CheckBox" 
                        AND widget_node.getTagName() ! = "RadioGroup"
                        AND widget_node.getTagName() ! = "Slider"
                        THEN
                            CALL widget_node.setAttribute("placeholder","Mandatory")
                        END IF
                    OTHERWISE
                        -- do nothing
                END CASE
            END IF
        END FOR
    END FOR
END FUNCTION