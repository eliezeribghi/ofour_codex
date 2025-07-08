mock_provider "google" {}

run "test_logic" {
  command = plan
  variables = {
    name_project = "fake-project"
  }
  assert {
    condition     = google_compute_instance.server.name == "ofour-test-server"
    error_message = "Nom incorrect"
  }
}
