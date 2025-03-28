import SwiftUI

struct HomeView: View {
	@State private var path = NavigationPath() // Path for managing navigation stack

	var body: some View {
		NavigationStack(path: $path) {
			ZStack {
				Color.yettelGreen
					.ignoresSafeArea()
				
				YettelButton(
					design: .filled,
					text: "Autópálya matricák",
					onTap: {
						path.append("HighwayPass")
					}
				)
				.padding(.horizontal, Padding.triple)
			}
			.navigationDestination(for: String.self) { value in
				if value == "HighwayPass" {
					HighwayPassStartingPage()
				} else if value == "CountySelection" {
					HighwayPassCountySelectionView()
				}
			}
		}
	}
}

#Preview {
	HomeView()
}
