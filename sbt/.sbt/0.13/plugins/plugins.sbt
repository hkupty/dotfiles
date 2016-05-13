resolvers ++= Seq(
  "Sonatype OSS Releases" at "https://oss.sonatype.org/content/repositories/releases/",
  "Sonatype OSS Snapshots" at "https://oss.sonatype.org/content/repositories/snapshots/"
)

addSbtPlugin("net.ceedubs" %% "sbt-ctags" % "0.2.0")
addSbtPlugin("org.ensime" % "ensime-sbt" % "0.4.0")
addSbtPlugin("org.scoverage" % "sbt-scoverage" % "1.3.5")
addSbtPlugin("me.penkov" % "sbt-notifications" % "0.0.2")
addSbtPlugin("com.geirsson" %% "sbt-scalafmt" % "0.1.1")
addSbtPlugin("de.johoop" % "jacoco4sbt" % "2.1.6")
addSbtPlugin("com.orrsella" % "sbt-stats" % "1.0.5")
