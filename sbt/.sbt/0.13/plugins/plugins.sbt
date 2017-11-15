resolvers ++= Seq(
  "Sonatype OSS Releases" at "https://oss.sonatype.org/content/repositories/releases/",
  "Sonatype OSS Snapshots" at "https://oss.sonatype.org/content/repositories/snapshots/"
)

addSbtPlugin("net.ceedubs" %% "sbt-ctags" % "0.2.0")
addSbtPlugin("org.ensime" % "sbt-ensime" % "1.12.13")
addSbtPlugin("org.scoverage" % "sbt-scoverage" % "1.5.0")
