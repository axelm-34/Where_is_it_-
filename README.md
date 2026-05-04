# where_is_it

Une application pour retrouver ses objets perdue

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

flutter run -d chrome



firebase :
				ps: si pendant ces étapes, on vous demande de créer un nouveau projet firebase, refusé avec "n"
vérification de flutterfire :
	flutterfire --version
s'il n'y a pas de version :
	dart pub global activate flutterfire_cli
	$env:Path += ";$HOME\AppData\Local\Pub\Cache\bin"
	
Puis :
node -v
npm -v
Si pas de versions :
	winget install OpenJS.NodeJS.LTS
	fermer et réouvir l'éditeur puis retester :
		node -v
		npm -v
	vous devriez voir des versions
Puis :
	npm install -g firebase-tools
	firebase login :
					suite de réponse : "n" "n"
		vous serez envoyer sur une page de connexion google, connectez vous avec le compte que vous voulez utiliser pour firebase
Puis :
	flutterfire configure
		s'il y à un problème "...is not recognized as a name of a cmdlet, function, script file, or executable program..."
		taper dans le terminal pwrshell : 
			[Environment]::SetEnvironmentVariable("Path", $env:Path + ";$HOME\AppData\Local\Pub\Cache\bin", [EnvironmentVariableTarget]::User)
	ferme l'éditeur puis réessaye :
		flutterfire configure
		Normalement, si tu as déjà créer un projet firebase, tu devrais le voir dans la liste, sinon créer le sur le site puis refais le commande
			(le site en question : https://console.firebase.google.com/project/ )