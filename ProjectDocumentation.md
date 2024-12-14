# Department of Dungeon Design #

## Summary ##

It’s another beautiful day of work at the Department of Dungeon Design! It’s always been your dream to work as a dungeon master and after all these years you know it’s time: you deserve a raise. Set up your defenses, rally the monsters, prime the traps! Meet your quota by slaying adventurers with your dungeon design, and maybe you’ll get the promotion of your dreams! Your paycheck comes out of that treasure you’re guarding, so you better not let any pesky adventurers through.

## Project Resources

[Web-playable version of your game (FIXME)](https://itch.io/)  
[Trailer (FIXME)](https://youtube.com)  
[Press Kit (FIXME)](https://dopresskit.com/)  
[Initial Plan](https://docs.google.com/document/d/1seP3CGc7eH109oYLATlTatLcgkJYDgn-x0SzhATfhZY/edit?usp=sharing)  

## Gameplay Explanation ##

**In this section, explain how the game should be played. Treat this as a manual within a game. Explaining the button mappings and the most optimal gameplay strategy is encouraged.**


**Add it here if you did work that should be factored into your grade but does not fit easily into the proscribed roles! Please include links to resources and descriptions of game-related material that does not fit into roles here.**

**FIXME**: include links and credits to background assets

# Roles #

Your goal is to relate the work of your role and sub-role in terms of the content of the course. Please look at the role sections below for specific instructions for each role.

Below is a template for you to highlight items of your work. These provide the evidence needed for your work to be evaluated. Try to have at least four such descriptions. They will be assessed on the quality of the underlying system and how they are linked to course content. 

*Short Description* - Long description of your work item that includes how it is relevant to topics discussed in class. [link to evidence in your repository](https://github.com/dr-jam/ECS189L/edit/project-description/ProjectDocumentTemplate.md)

Here is an example:  
*Procedural Terrain* - The game's background consists of procedurally generated terrain produced with Perlin noise. The game can modify this terrain at run-time via a call to its script methods. The intent is to allow the player to modify the terrain. This system is based on the component design pattern and the procedural content generation portions of the course. [The PCG terrain generation script](https://github.com/dr-jam/CameraControlExercise/blob/513b927e87fc686fe627bf7d4ff6ff841cf34e9f/Obscura/Assets/Scripts/TerrainGenerator.cs#L6).

You should replay any **bold text** with your relevant information. Liberally use the template when necessary and appropriate.

## Ezren Aldas ##

### Producer

*Ideation* - Actively participated in initial game ideation, created sketches and worked with team to develop ideas

<img src="./project_doc_materials/ezren/sketch1.jpg" alt="Sketch thumbnails of play phases" height="500">
Above: Sketch thumbnails of play phases

<img src="./project_doc_materials/ezren/sketch2.jpg" alt="Sketches and notes of game screens" height="500">
Above: Sketches and notes of game screens

<img src="./project_doc_materials/ezren/watercoolerslime1-sketch.png" alt="digital sketch sprite of watercooler-themed cube slime monster">
<img src="./project_doc_materials/ezren/watercoolerslime2-sketch.png" alt="digital sketch sprite of watercooler-shaped slime monster">
Above: Two ideation sketches of watercooler-themed slime monster sprites

*Initial Schedule* - Created rough schedule in initial plan

*Team meetings* - Scheduled team meetings over Discord to check progress, created [meeting notes](https://docs.google.com/document/d/1NNRejOOlFjJQT2Wy9uCQfDIvcaMyyb9y9IaMTauezOU/edit?usp=sharing), managed team progress

### Narrative Design

*Money System* - Developed money system and [moneyengine.md](./dungeon_dept/scripts/global/money_engine.gd), to act as scoring system incentivizing play that ties into corporate narrative

*Opening cutscene* - Implemented [opening cutscene](./dungeon_dept/scenes/cutscene.tscn) to give backstory and prologue to players, drew rough draft sketches and wrote narration

### Other Contributions

*Damage mechanics* - For each entity scene (knight, skeleton, slime, golem): Worked on take_damage functions (e.g. [func take_damage in knight.gd](https://github.com/twobles/ecs-179-project-dungeon-dept/blob/63dba52300e3ed61025ec35cca247d69ac9c2e10/dungeon_dept/scripts/adventurers/knight.gd#L25)), added and implemented DamageTaken label node for indicating amount of damage taken

## Ivan Hoang ##

### Animation and Visuals

**List your assets, including their sources and licenses.**

**Describe how your work intersects with game feel, graphic design, and world-building. Include your visual style guide if one exists.**

### Game Feel and Polish

**Document what you added to and how you tweaked your game to improve its game feel.**

### Other Contributions

**Other contributions outside roles. Delete section if not applicable**


## Josh Lai ##

### User Interface and Input

**Describe your user interface and how it relates to gameplay. This can be done via the template.**

The start menu has an option to start the game. Once the start button is clicked, a cutscene-style slideshow is played where the user can click through the slides to progress through the cutscene. After, the user is taken to a map with 3 boxes where they have a choice of choosing one. In each room, there is a build menu UI where the user can place down a combination of 3 monsters. Utilizing the 1, 2, and 3 number keys, the respective monsters will be shown and by pressing the left mouse button, they will be placed down within the board area. The user can also choose to clear the monster chosen by pressing the backspace key. Once the user is finished placing down monster entities, they can click ready and the battle scene will begin. The user can also go through different rooms by clicking the shift key and selecting the room in the map.

**Describe the default input configuration.**

The default input configuration is keyboard and mouse. 

**Add an entry for each platform or input style your project supports.**

&nbsp;&nbsp;&nbsp;&nbsp;Left Mouse Button: Pressing all buttons and placing monsters down on the map

&nbsp;&nbsp;&nbsp;&nbsp;Number 1 Key: Choosing skeleton

&nbsp;&nbsp;&nbsp;&nbsp;Number 2 Key: Choosing slime

&nbsp;&nbsp;&nbsp;&nbsp;Number 3 Key: Choosing golem

&nbsp;&nbsp;&nbsp;&nbsp;Backspace Key: Clearing shown monster

&nbsp;&nbsp;&nbsp;&nbsp;Shift Key: Go back to the map

### Audio

**List your assets, including their sources and licenses.**

Audio Sources: 

Menu Soundtrack: Goblins_Den_(Regular).ogg by Leohpaz -- https://leohpaz.itch.io/minifantasy-dungeon-sfx-pack

Battle Soundtrack: Goblins_Dance_(Battle).ogg by Leohpaz -- https://leohpaz.itch.io/minifantasy-dungeon-sfx-pack

Clicking SFX: Click1B.ogg by EpeSami -- https://epesami.itch.io/mechanical-click-sound-pack

Skeleton SFX: Rattling Bones.wav by spookymodem -- https://freesound.org/s/202102/ -- License: Creative Commons 0

Slime SFX: Slosh A.wav by samuelcable -- https://freesound.org/s/393494/ -- License: Creative Commons 0

Golem SFX: Thump Slice.wav by johnnypanic -- https://freesound.org/s/320826/ -- License: Creative Commons 0

**Describe the implementation of your audio system.**

<u>Soundtrack:</u> Upon the project being ran, the menu soundtrack is being played on a loop. This continues when the user enters the room. When the user clicks ready in a room, the battle soundtrack will be played on a loop. However, when switching back to the map, the menu soundtrack is played again. This logic is applicable to every room in the map. 

<u>Sound Effects:</u> There is a clicking sound effect that is played whenever a button is clicked. In the Build Menu UI, sound effects are being played depending on which monster is being placed down for roughly one second. When the skeleton is placed down, a bone rattling sound effect plays. When the slime is placed down, a water sloshing sound effect plays. When the golem is placed down, a thumping sound effect plays.

**Document the sound style.** 

The style of the sound was aimed to represent adventurers invading a dungeon. Thus, we wanted to find a soundtrack that had dark undertones while still having an appropriate game soundtrack. The battle soundtrack involves a more jumpier beat that reflects the adventurers and monsters in battle. The sound effects of the monsters being placed down was intended to achieve an interactive connection with the user.

### Other Contributions

**Other contributions outside roles. Delete section if not applicable**


## Joe Zhu ##

### Movement/Physics

**Describe the basics of movement and physics in your game. Is it the standard physics model? What did you change or modify? Did you make your movement scripts that do not use the physics system?**

### Press Kit and Trailer

**Include links to your presskit materials and trailer.**

**Describe how you showcased your work. How did you choose what to show in the trailer? Why did you choose your screenshots?**

### Other Contributions

**Other contributions outside roles. Delete section if not applicable**


## Huy Vuu ##

### Game Logic

**Document the game states and game data you managed and the design patterns you used to complete your task.**

### Gameplay Testing

**Add a link to the full results of your gameplay tests.**

**Summarize the key findings from your gameplay tests.**

### Other Contributions

**Other contributions outside roles. Delete section if not applicable**

