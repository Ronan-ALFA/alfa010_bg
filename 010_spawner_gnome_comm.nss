void main()
{
	string sResRef;
	switch (Random(18))
		{
			case 1:
			case 2:
				sResRef="010_cr_gnome_comm0";
				break;
			case 3:
			case 4:
				sResRef="010_cr_gnome_comm1";
				break;
			case 5:
			case 6:
				sResRef="010_cr_gnome_comm2";
				break;
			case 7:
			case 8:
				sResRef="010_cr_gnome_comm3";
				break;
			case 9:sResRef="abr_cr_GnomeExpertM";break;
			case 10:sResRef="abr_cr_GnomeExpertF";break;
			case 11:sResRef="abr_cr_GnomeWarriorX";break;
			case 12:sResRef="abr_cr_GnomeWarriorH";break;
			case 13:sResRef="abr_cr_GnomeAdeptM";break;
			case 14:sResRef="abr_cr_GnomeAdeptF";break;
			default: sResRef="";
		}

	DelayCommand(0.1,DestroyObject(OBJECT_SELF));

	if (sResRef == "")
		return;
		
	object oSpawned=CreateObject(OBJECT_TYPE_CREATURE,sResRef,GetLocation(OBJECT_SELF),FALSE,GetTag(OBJECT_SELF));	
	
	SetLocalInt(oSpawned, "X2_L_SPAWN_USE_AMBIENT_IMMOBILE", 1);
	
	if (Random(100) > 80)
		SetLocalInt(oSpawned, "X2_L_SPAWN_USE_AMBIENT", 1);

}
