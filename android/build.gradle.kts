allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.buildDir = layout.buildDirectory.asFile.get()

subprojects {
    project.buildDir = File(rootProject.buildDir, project.name)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.buildDir)
}

// C'EST CETTE PARTIE QUI MANQUE
buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath("com.google.gms:google-services:4.4.1")
    }
}