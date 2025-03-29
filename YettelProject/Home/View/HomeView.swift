import SwiftUI

struct HomeView: View {
	@StateObject var pathManager = NavigationPathManager()
	
	var body: some View {
		NavigationStack(path: $pathManager.path) {
			ZStack {
				Color.yettelGreen
					.ignoresSafeArea()
				
				YettelButton(
					design: .filled,
					text: "Autópálya matricák",
					onTap: {
						pathManager.path.append("HighwayPass")
					}
				)
				.padding(.horizontal, Padding.triple)
			}
			.navigationDestination(for: String.self) { value in
				if value == "HighwayPass" {
					HighwayPassStartingPage()
				} else if value == "CountySelection" {
					HighwayPassCountySelectionView()
				} else if value == "Confirmation" {
					HighwayPassConfirmationView()
				}
				else if value == "Success" {
					HighwayPassSuccessView()
				}
			}
		}
		.environmentObject(pathManager)
	}
}

#Preview {
	HomeView()
}
