{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "rm_CardGame",
  "creationCodeFile": "",
  "inheritCode": false,
  "inheritCreationOrder": false,
  "inheritLayers": false,
  "instanceCreationOrder": [
    {"name":"inst_72B02413","path":"rooms/rm_CardGame/rm_CardGame.yy",},
    {"name":"inst_53F0CA9D","path":"rooms/rm_CardGame/rm_CardGame.yy",},
    {"name":"inst_6A217F14","path":"rooms/rm_CardGame/rm_CardGame.yy",},
    {"name":"inst_544ED48C","path":"rooms/rm_CardGame/rm_CardGame.yy",},
    {"name":"inst_160D1517","path":"rooms/rm_CardGame/rm_CardGame.yy",},
    {"name":"inst_6541DAAB","path":"rooms/rm_CardGame/rm_CardGame.yy",},
    {"name":"inst_CC08020","path":"rooms/rm_CardGame/rm_CardGame.yy",},
    {"name":"inst_5D0FB342","path":"rooms/rm_CardGame/rm_CardGame.yy",},
    {"name":"inst_3C56673A","path":"rooms/rm_CardGame/rm_CardGame.yy",},
    {"name":"inst_605C239B","path":"rooms/rm_CardGame/rm_CardGame.yy",},
    {"name":"inst_7DFFBD36","path":"rooms/rm_CardGame/rm_CardGame.yy",},
    {"name":"inst_66EA87C1","path":"rooms/rm_CardGame/rm_CardGame.yy",},
    {"name":"inst_67B1A533","path":"rooms/rm_CardGame/rm_CardGame.yy",},
    {"name":"inst_1D54A989","path":"rooms/rm_CardGame/rm_CardGame.yy",},
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances_UI","depth":0,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":true,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances","depth":100,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_72B02413","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_Deck","path":"objects/obj_Deck/obj_Deck.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_Deck","path":"objects/obj_Deck/obj_Deck.yy",},"propertyId":{"name":"owner","path":"objects/obj_Deck/obj_Deck.yy",},"value":"CardPlayer.LEFT",},
          ],"rotation":0.0,"scaleX":0.25,"scaleY":0.25,"x":160.0,"y":704.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_53F0CA9D","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_Deck","path":"objects/obj_Deck/obj_Deck.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_Deck","path":"objects/obj_Deck/obj_Deck.yy",},"propertyId":{"name":"owner","path":"objects/obj_Deck/obj_Deck.yy",},"value":"CardPlayer.RIGHT",},
          ],"rotation":0.0,"scaleX":0.25,"scaleY":0.25,"x":864.0,"y":64.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_6A217F14","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"ctrl_CardGameManager","path":"objects/ctrl_CardGameManager/ctrl_CardGameManager.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":32.0,"y":32.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_544ED48C","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_DiscardPile","path":"objects/obj_DiscardPile/obj_DiscardPile.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_DiscardPile","path":"objects/obj_DiscardPile/obj_DiscardPile.yy",},"propertyId":{"name":"owner","path":"objects/obj_DiscardPile/obj_DiscardPile.yy",},"value":"CardPlayer.LEFT",},
          ],"rotation":0.0,"scaleX":0.25,"scaleY":0.25,"x":64.0,"y":704.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_160D1517","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_DiscardPile","path":"objects/obj_DiscardPile/obj_DiscardPile.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_DiscardPile","path":"objects/obj_DiscardPile/obj_DiscardPile.yy",},"propertyId":{"name":"owner","path":"objects/obj_DiscardPile/obj_DiscardPile.yy",},"value":"CardPlayer.RIGHT",},
          ],"rotation":0.0,"scaleX":0.25,"scaleY":0.25,"x":960.0,"y":64.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_6541DAAB","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_PlayerOngoingRow","path":"objects/obj_PlayerOngoingRow/obj_PlayerOngoingRow.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_PlayerOngoingRow","path":"objects/obj_PlayerOngoingRow/obj_PlayerOngoingRow.yy",},"propertyId":{"name":"owner","path":"objects/obj_PlayerOngoingRow/obj_PlayerOngoingRow.yy",},"value":"CardPlayer.LEFT",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":272.0,"y":544.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_CC08020","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_PlayerHand","path":"objects/obj_PlayerHand/obj_PlayerHand.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_PlayerHand","path":"objects/obj_PlayerHand/obj_PlayerHand.yy",},"propertyId":{"name":"owner","path":"objects/obj_PlayerHand/obj_PlayerHand.yy",},"value":"CardPlayer.LEFT",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":272.0,"y":672.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_5D0FB342","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_PlayerMinionRow","path":"objects/obj_PlayerMinionRow/obj_PlayerMinionRow.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_PlayerMinionRow","path":"objects/obj_PlayerMinionRow/obj_PlayerMinionRow.yy",},"propertyId":{"name":"owner","path":"objects/obj_PlayerMinionRow/obj_PlayerMinionRow.yy",},"value":"CardPlayer.LEFT",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":272.0,"y":416.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_3C56673A","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_PlayerOngoingRow","path":"objects/obj_PlayerOngoingRow/obj_PlayerOngoingRow.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_PlayerOngoingRow","path":"objects/obj_PlayerOngoingRow/obj_PlayerOngoingRow.yy",},"propertyId":{"name":"owner","path":"objects/obj_PlayerOngoingRow/obj_PlayerOngoingRow.yy",},"value":"CardPlayer.RIGHT",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":272.0,"y":128.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_605C239B","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_PlayerMinionRow","path":"objects/obj_PlayerMinionRow/obj_PlayerMinionRow.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_PlayerMinionRow","path":"objects/obj_PlayerMinionRow/obj_PlayerMinionRow.yy",},"propertyId":{"name":"owner","path":"objects/obj_PlayerMinionRow/obj_PlayerMinionRow.yy",},"value":"CardPlayer.RIGHT",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":272.0,"y":256.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_7DFFBD36","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_PlayerHand","path":"objects/obj_PlayerHand/obj_PlayerHand.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_PlayerHand","path":"objects/obj_PlayerHand/obj_PlayerHand.yy",},"propertyId":{"name":"owner","path":"objects/obj_PlayerHand/obj_PlayerHand.yy",},"value":"CardPlayer.RIGHT",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":272.0,"y":0.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_66EA87C1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_CardPlayerStats","path":"objects/obj_CardPlayerStats/obj_CardPlayerStats.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_CardPlayerStats","path":"objects/obj_CardPlayerStats/obj_CardPlayerStats.yy",},"propertyId":{"name":"owner","path":"objects/obj_CardPlayerStats/obj_CardPlayerStats.yy",},"value":"CardPlayer.LEFT",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":32.0,"y":576.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_67B1A533","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_CardPlayerStats","path":"objects/obj_CardPlayerStats/obj_CardPlayerStats.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_CardPlayerStats","path":"objects/obj_CardPlayerStats/obj_CardPlayerStats.yy",},"propertyId":{"name":"owner","path":"objects/obj_CardPlayerStats/obj_CardPlayerStats.yy",},"value":"CardPlayer.RIGHT",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":832.0,"y":128.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_1D54A989","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_EndTurnButton","path":"objects/obj_EndTurnButton/obj_EndTurnButton.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":896.0,"y":704.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"Background","animationFPS":15.0,"animationSpeedType":0,"colour":4284900966,"depth":200,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"hspeed":0.0,"htiled":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"spriteId":null,"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
  ],
  "parent": {
    "name": "Rooms",
    "path": "folders/Rooms.yy",
  },
  "parentRoom": null,
  "physicsSettings": {
    "inheritPhysicsSettings": false,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "roomSettings": {
    "Height": 768,
    "inheritRoomSettings": false,
    "persistent": false,
    "Width": 1024,
  },
  "sequenceId": null,
  "views": [
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings": {
    "clearDisplayBuffer": true,
    "clearViewBackground": false,
    "enableViews": false,
    "inheritViewSettings": false,
  },
  "volume": 1.0,
}