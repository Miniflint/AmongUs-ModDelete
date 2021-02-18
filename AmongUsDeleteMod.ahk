if (fileExist( "C:\Program Files (x86)\Steam\steamapps\common\Among Us"),D)
{
    AmongUsPathSteam = C:\Program Files (x86)\Steam\steamapps\common
    GETUSERINPUT(AmongUsPathSteam)
}
else if (FileExist("C:\Program Files\Epic Games\Among Us"),D)
{
    AmongUsPathEpic = C:\Program Files\Epic Games
    GETUSERINPUT(AmongUsPathEpic)
}
else if (FileExist("D:\SteamLibrary\steamapps\common\Among Us"),D)
{
    AmongUsPathDriverD = C:\Program Files\Epic Games
    GETUSERINPUT(AmongUsPathDriverD)
}
else if !(FileExist("D:\SteamLibrary\steamapps\common\Among Us"),D)
{
    msgbox, 0, An input box is gonna pop, don't slect the among us folder, select the folder WHERE among us is
    FileSelectFolder, NothingFound,,, don't slect the among us folder, select the folder WHERE among us is `nNOT THE AMONG US FOLDER
    if NothingFound = 
        Msgbox, You haven't selected anything
    else
        GETUSERINPUT(NothingFound)
}

GETUSERINPUT(FolderStart)
{
Filefolder = 1
while(FileFolder = 1)
{
    FileFolder = 1
    FileSelectFolder, FDirectory, %FolderStart%,, Select the folder to delete
        if ErrorLevel
        {
            FileFolder = 0
            return
        }
        else if FDirectory = 
        {
            msgbox, vous n'avez rien selectionner
            FileFolder = 0
        }
        else
        {
            FileRemoveDir, %FDirectory%, 1
            StringGetPos, pos, FDirectory , \, R                              
            pos++                                                          
            StringTrimLeft, lastpart, FDirectory, %pos%
            NewStr := StrReplace(lastpart, ".", A_SPACE)
            FileDelete, %A_DESKTOP%\%NewStr%.lnk
            MsgBox, 4,, Would you like to continue?
            IfMsgBox Yes
            {
                filefolder = 1
            }
            else
            {
                Filefolder = 0
            }
        }
}
    
}