// Display Prims named: 
// xyzzytext-0-0 xyzzytext-0-1
// xyzzytext-1-0 xyzzytext-1-1
// 
// Quickstart:
// * Store all scripts in your inventory
// * Rez a box
// * Drop the prim setup script in it (You now have one unit, name it xyzzytext-0-0)
// * Make a row of four of these prims (xyzzytext-0-0 xyzzytext-0-1,xyzzytext-0-2,xyzzytext-0-3)
// * Move a copy of this row a little down, and rename the new row(xyzzytext-1-0 xyzzytext-1-1,xyzzytext-1-2,xyzzytext-1-3)
// * Do this for every row you make
// * Create a big box that serves as the board-background(mainprim)
// * Link all prims with the mainprim(selected last), so the mainprim keeps yellow after linking(root-prim)
// * Copy the main script and usage script into the root prim
// * Type something, and check if it all works
// * Flatten the prims, so the text looks straight
// * Consider adding slave scripts to the root prim if you have a lot of rows
// 

integer DISPLAY_STRING      = 204000; 
integer DISPLAY_EXTENDED    = 204001; 
integer REMAP_INDICES       = 204002; 
integer RESET_INDICES       = 204003; 
integer SET_FADE_OPTIONS    = 204004; 
integer SET_FONT_TEXTURE    = 204005; 
integer SET_LINE_COLOR      = 204006; 
integer SET_COLOR           = 204007; 
integer RESCAN_LINKSET      = 204008;
 
 
integer gToggle;
 
default
{
    state_entry()
    {
        llListen(0,"",NULL_KEY,"");
 
    }
 
 
    listen(integer channel,string name, key id, string message)
    {
        if (gToggle)
            llMessageLinked(LINK_THIS,DISPLAY_STRING,name + ":"+ message,"0");
        else
            llMessageLinked(LINK_THIS,DISPLAY_STRING,name + ":"+ message,"1");
 
        gToggle=!gToggle;
 
    }
}
