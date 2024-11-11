//
//  Chart.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 4.11.24.
//

import Charts
import SwiftUI

struct PlotInfo: Identifiable {
    var id: Int
    var x: String
    var y: Int

    static func fetchData() -> [PlotInfo] {
        [
            .init(id: 1, x: "Day 1", y: 12),
            .init(id: 2, x: "Day 2", y: 13),
            .init(id: 3, x: "Day 3", y: 14),
            .init(id: 4, x: "Day 4", y: 35),
        ]
    }

    static func fetchData2() -> [PlotInfo] {
        [
            .init(id: 1, x: "Day 1", y: 24),
            .init(id: 2, x: "Day 2", y: 3),
            .init(id: 3, x: "Day 3", y: 4),
            .init(id: 4, x: "Day 4", y: 5),
        ]
    }
}

struct ChartTest: View {
    var body: some View {
        // Chart(PlotInfo.fetchData()) { data in
        Chart {
            ForEach(PlotInfo.fetchData()) { data in
                LineMark(
                    x: .value("Labels", data.x), y: .value("Values", data.y),
                    series: .value("A", "A"))
            }

            ForEach(PlotInfo.fetchData2()) { data in
                LineMark(
                    x: .value("Labels", data.x), y: .value("Values", data.y),
                    series: .value("B", "B")
                )
                .foregroundStyle(.red)
            }

            RuleMark(y: .value("Goal", 20))
                .lineStyle(StrokeStyle(lineWidth: 2, dash: [10, 10]))
                .foregroundStyle(.orange)

            //RuleMark(xStart: .value("Start", "Day 3"), xEnd: .value("Start", "Day 5"), y: .value("Goal", 50))
        }
        .chartForegroundStyleScale(
            ["Perlin wow" : .red, "Mondelbrot wow" : .blue]
        )
        .chartXAxisLabel(position: .top, alignment: .center) {
            Text("X-Axis")
                .font(.title.bold())
                .frame(width: 200)
                .padding()
                .background(
                    Color.blue.opacity(0.1),
                    in: RoundedRectangle(cornerRadius: 10))
        }
        .chartYAxisLabel("Y-Axis", position: .leading, alignment: .center)
        .padding()
    }
}

struct SomeGroupmates: Identifiable {
    let id: String = UUID().uuidString
    var x = ""
    var y = 0
    var group: String

    static func fetchData() -> [SomeGroupmates] {
        [
            SomeGroupmates(x: "A", y: 10, group: "Perlin"),
            SomeGroupmates(x: "B", y: 20, group: "Perlin"),
            SomeGroupmates(x: "C", y: 30, group: "Perlin"),
            SomeGroupmates(x: "D", y: 40, group: "Perlin"),
            SomeGroupmates(x: "A", y: 20, group: "Mondelbrot"),
            SomeGroupmates(x: "B", y: 10, group: "Mondelbrot"),
            SomeGroupmates(x: "C", y: 50, group: "Mondelbrot"),
            SomeGroupmates(x: "D", y: 30, group: "Mondelbrot"),
        ]
    }
}

struct GroupLegendChart: View {
    @State var data = SomeGroupmates.fetchData()
    @State var iMethod = InterpolationMethod.linear

    var body: some View {
        VStack {
            Chart(data) { groupMate in
                LineMark(
                    x: .value("Category", groupMate.x),
                    y: .value("Some value", groupMate.y)
                )
                .foregroundStyle(by: .value("Group", groupMate.group))
                .lineStyle(StrokeStyle(lineWidth: 4, lineJoin: .round))
                .symbol(.circle)
                .interpolationMethod(iMethod)

                PointMark(
                    x: .value("Labels", groupMate.x),
                    y: .value("Some points", groupMate.y + 20)
                )
                .symbol(.diamond)
                .foregroundStyle(by: .value("Some points", groupMate.x))
                .symbolSize(by: .value("Some points", groupMate.y + 20))
            }
            .padding()
            .dynamicTypeSize(.xxLarge)

            GroupBox("Interpolation Method") {
                HStack {
                    Button("Linear") {
                        iMethod = .linear
                    }
                    Button("Cubic") {
                        iMethod = .catmullRom
                    }
                    Button("Cardinal") {
                        iMethod = .cardinal
                    }
                    Button("Mono") {
                        iMethod = .monotone
                    }
                    Button("Step") {
                        iMethod = .stepCenter
                    }
                }
                .frame(
                    minWidth: UIScreen.main.bounds.width - 32,
                    alignment: .leading)
            }
        }
    }
}

struct PieChart: View {
    private let pieChartData = PlotInfo.fetchData()
    
    var body: some View {
        Chart(pieChartData) { data in
            SectorMark(angle: .value("Values", data.y), angularInset: 4)
                .cornerRadius(400)
                .foregroundStyle(by: .value("Why?", data.x))
        }
        .chartLegend(position: .bottom, alignment: .center)
        .dynamicTypeSize(.accessibility2)
        .padding()
    }
}

#Preview {
    PieChart()
}

#Preview {
    GroupLegendChart()
}

#Preview {
    ChartTest()
}
