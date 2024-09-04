import scala.io.Source
import java.io.{File, PrintWriter}

object DataCleaner {
  def cleanData(inputFile: String, outputFile: String): Unit = {
    val source = Source.fromFile(inputFile, "UTF-8")
    val lines = source.getLines().toList
    source.close()

    val header = lines.head.split(",").map(_.trim)
    val colorIndex = header.indexOf("color")
    val gradeIndex = header.indexOf("grade")
    val fuelIndex = header.indexOf("fuel")
    val transmissionIndex = header.indexOf("transmission")

    val writer = new PrintWriter(new File(outputFile), "UTF-8")
    writer.println(header.mkString(","))

    for (line <- lines.tail) {
      val row = line.split(",").map(_.trim)
      val cleanedRow = row.zipWithIndex.map { case (item, index) =>
        if (item.isEmpty && (index == colorIndex || index == gradeIndex || index == fuelIndex || index == transmissionIndex)) {
          "N/A"
        } else {
          item
        }
      }
      writer.println(cleanedRow.mkString(","))
    }

    writer.close()
  }

  def main(args: Array[String]): Unit = {
    val inputFile = "final_scrape_cars45.csv"
    val outputFile = "cleaned_data.csv"
    cleanData(inputFile, outputFile)
  }
}