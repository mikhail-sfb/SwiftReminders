//
//  TextTests.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 12.11.24.
//

import SwiftUI

struct TextTests: View {
    // MARK: To scale a value more, have that value relative to a smaller text style. Smaller text styles tend to get larger faster. (But larger text styles tend to get smaller faster.)
    @ScaledMetric var fontSize: CGFloat = 50
    @ScaledMetric(wrappedValue: 24, relativeTo: .caption) var fontSizeRelative: CGFloat

    // MARK: Cool thing
    var myAtributedString: AttributedString {
        let fullLine = "Hello World!"
        var atributedName = AttributedString(fullLine)
        
        let hello = atributedName.range(of: "Hello")!
        let world = atributedName.range(of: "World")!
        
        atributedName[hello].foregroundColor = .red
        atributedName[world].foregroundColor = .green
        
        return atributedName

    }
    
    var body: some View {
        // MARK: Line limit

        VStack {
            Text("Here is a long text that will be wrapped to the next line.")
                .lineLimit(1)
                .padding(.horizontal)

            Divider()
            
            // MARK: AtributedString
            Text(myAtributedString)
            
            Divider()

            Form {
                Section("styles") {
                    Group {
                        Text("Font.largeTitle").font(.largeTitle)
                            .dynamicTypeSize(.large ... .xLarge)
                        Text("Font.title").font(.title)
                        Text("Font.headline").font(.headline)
                            .dynamicTypeSize(.small ... .large)
                        Text("Font.subheadline").font(.subheadline)
                        Text("Font.body").font(.body)
                        Text("Font.caption").font(.caption)
                        Text("Font.footnote").font(.footnote)
                        Text("Font.callout").font(.callout)
                    }
                }

                Section("Weights") {
                    Group {
                        Text("Ultralight").fontWeight(.ultraLight)
                        Text("Thin").fontWeight(.thin)
                        Text("Light").fontWeight(.light)
                        Text("Regular").fontWeight(.regular)
                        Text("Medium").fontWeight(.medium)
                        Text("Semibold").fontWeight(.semibold)
                        Text("Bold").fontWeight(.bold)
                        Text("Heavy").fontWeight(.heavy)
                        Text("Black").fontWeight(.black)
                    }
                }

                Section("Formatting") {
                    Group {
                        Text("Bold")
                            .bold()

                        Text("Italic")
                            .italic()

                        Text("Strikethrough")
                            .strikethrough()

                        Text("Green strikethrough")
                            .strikethrough(true, color: .green)

                        Text("Foreground style")
                            .foregroundStyle(.green)

                        Text("Underline")
                            .underline()

                        Text("Green underline")
                            .underline(true, color: .green)
                    }
                }
            }
            .frame(height: 400)
        }

        Divider()

        ScrollView {
            // MARK: 2 modi in 1 line
            Text("Dont repeat code!")
                .font(Font.title.weight(.black))

            Divider()

            // MARK: Some designes
            Text("Monoooo")
                .font(.system(.title3, design: .monospaced))

            Text("Monoooo")
                .font(.system(.title2, design: .rounded))

            Text("Monoooo")
                .font(.system(.title, design: .serif))

            Divider()

            // MARK: tight
            // Allows Tightening can be helpful when you see the last word getting truncated. Applying it may not even fully work depending on just how much space can be tightened. With the default font, I notice I can get a couple of characters worth of space to tighten up.
            Group {
                Text("Allows tightening to allow text to fit in one line")
                    .foregroundStyle(.red)
                    .allowsTightening(false)
                    .lineLimit(1)

                Text("Allows tightening to allow text to fit in one line")
                    .foregroundStyle(.red)
                    .allowsTightening(true)
                    .lineLimit(1)
            }
            .padding(.horizontal, 30)

            Divider()

            // MARK: Minimum scale factor
            // .minimumScaleFactor takes a fraction from 0 to 1. For example, 0.3 is 30% of the original size of the font that it can shrink. If the font size is 100, then it can shrink to 30.
            Group {
                Text("This text is ser to a minimum scale factor of 0.3")
                    .lineLimit(1)
                    .minimumScaleFactor(0.3)
                Text("This text is ser to a minimum scale factor of 0.5")
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                Text("This text is ser to a minimum scale factor of 0.7")
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
                Text("This text is ser to a minimum scale factor of 0.9")
                    .lineLimit(1)
                    .minimumScaleFactor(0.9)
            }
            .font(.title)
            .truncationMode(.middle)
            .padding(.horizontal)

            Divider()

            // MARK: Line spacing
            Group {
                Text("Linespacing:")
                    .font(.title.bold())
                
                Text(
                    "Line spacing is set to 10 and this text is huge and has no sense to fit in one line so it will wrap more Line spacing is set to 10 and this text is huge and has no sense to fit in one line so it will wrap more"
                )
                .lineSpacing(20)
                
                Divider()
                    .frame(height: 10)
                    .foregroundColor(Color.blue)
                
                Text(
                    "Line spacing is set to 10 and this text is huge and has no sense to fit in one line so it will wrap more Line spacing is set to 10 and this text is huge and has no sense to fit in one line so it will wrap more"
                )
            }
            .padding(.horizontal)
            
            Divider()
            
            // MARK: Change alignment
            Text(
                "Line spacing is set to 10 and this text is huge and has no sense to fit in one line so it will wrap more Line spacing is set to 10 and this text is huge and has no sense to fit in"
            )
            .multilineTextAlignment(.trailing)
            
            Divider()
            
            // MARK: Change truncation
            Text("This is a test for test for test for test for stetdtstststhsdjhshdjhdjhdcjhdsjdjcdjckjj")
                .truncationMode(.head)
                .lineLimit(1)
            
            Divider()
            
            // MARK: You can format different part of Text views
            Group {
                Text("Here is another ")
                + Text("example").foregroundStyle(.red).underline()
                + Text (" of how you might accomplish this. ")
                + Text("Notice").foregroundStyle(.purple).bold()
                + Text (" the use of the Group view to add padding and line limit to all the text ")
                + Text("as a whole.").bold().italic()
            }.font(.title).padding(.horizontal)
            
            Divider()
            
            // MARK: If we combine to much we could be in need of baseline offset
            Group {
                Text("100").bold()
                + Text(" SWIFTUI ")
                    .font(Font.system(size: 60))
                    .fontWeight(.ultraLight)
                    .foregroundStyle(.blue)
                    .baselineOffset(-12) // Negative numbers make it go down
                + Text ("VIEWS").bold()
            }
            
            // MARK: Layout priority - Layout priority controls which view will get truncated last.
            // The higher the priority, the last it is in line to get truncated.
            VStack {
                Text("This text gets truncated first because it has no priority.")
                    .font(.title)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.pink)
            }
            .frame(height: 40)
            
            Divider()
            
            // MARK: Fonts
            
            Section("Fonts") {
                Text("Hello??")
                    .font(.custom("HelveticaNeue-Light", size: 32))
                
                Text("Hello??")
                    .font(.custom("No such", size: 32)) // MARK: In order this to work you need to change "Fonts provided by app key"
            }
            
            Divider()

            // MARK: Some strange stuff
            Text("Test is the TEXT")
                .font(.title.uppercaseSmallCaps())
            
            Divider()
            
            // MARK: Letter spacing
            Text("Letter spicing but no")
                .tracking(10)
            
            
            // MARK: Format dates without formatters
            Section("Format dates") {
                Text(Date(), style: .date)
                Text(Date(), style: .time)
                Text(Date(), style: .relative)
                Text(Date(), style: .timer)
                Text(Date()...Date().addingTimeInterval(6000))
                Text("\(1...10)")
                Text("lower to upper")
                    .textCase(.uppercase)

            }
            .font(.title)
            
            Divider()
            
            // MARK: ScaledMetric property wrapper adjust some property in relation to the dynamic type increasing or decreasing
            Group {
                Text("ScaledMetricLarge")
                    .font(.system(size: fontSize))
                
                Text("ScaledMetricSmall")
                    .font(.system(size: fontSizeRelative))
            }
         
            
            Divider()

            // MARK: Markdown in swift
            Group {
                Text("**Bold**")
                Text("__Bold__")
                Text("*Italic*")
                Text("_Italic_")
                Text("___Italic adn bold___")
                Text("Monospace: `Hello World`")
                Text("~~Strikethrough~~")
                Text("[Link](https://www.apple.com)")
            }
            
            Divider()
            
            // MARK: In order to long press and cope use...
            Text("Copy me!")
                .textSelection(.enabled)
            
            Divider()

            // MARK: Formatting (can also measurments, names also 😭
            Group {
                // nums
                Text(12, format: .number)
                Text(12, format: .percent)
                Text(12, format: .currency(code: "BYN"))
                
                // MARK: Dates
                Text(Date().formatted(date: .abbreviated, time: .omitted))
                Text(Date().formatted(date: .complete, time: .omitted))
                Text(Date().formatted(date: .omitted, time: .omitted))
                Text(Date().formatted(date: .long, time: .omitted))
                Text(Date().formatted(date: .numeric, time: .omitted))

                Text("**Week of the year**: \(Date().formatted(.dateTime.week()))")
                Text("**Day of the week**: \(Date().formatted(.dateTime.week(.weekOfMonth)))")
                Text("**Time Zone**: \(Date().formatted(.dateTime.timeZone()))")
                Text(Date().formatted(.dateTime.minute().hour(.twoDigits(amPM: .omitted))))
                }
            
            
        }
    }
}

#Preview {
    TextTests()
}
