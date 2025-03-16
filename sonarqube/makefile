
sonar-scan:
	docker run \
		--rm \
		--network="host" \
		-e SONAR_HOST_URL="http://localhost:9000" \
		-e SONAR_TOKEN="sqp_e35c226df349318305440ef7e31216abc1a75f18" \
		-v "/home/kevin/Projet_devops_oclock/Apothéose/Codex-Nornes/ofour/:/usr/src" \
		sonarsource/sonar-scanner-cli \
		-Dsonar.projectKey=Ofour