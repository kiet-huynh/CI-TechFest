#This build assumes the following directory structure
#
#  \Build          - This is where the project build code lives
#  \BuildArtifacts - This folder is created if it is missing and contains output of the build
#  \Code           - This folder contains the source code or solutions you want to build
#
Properties {
	$project_name = "CISample"
	if(-not $version)
	{
		$version = "1.0.0.0"
	}
	$framework = '4.5'
	$base_dir = resolve-path .
	$build_dir = "$base_dir\_build"
	$temp_package_dir = "$build_dir\temp_for_packaging"
	$package_dir = "$build_dir\latestVersion"
	$warranty_package_file = "$package_dir\Warranty_Package.zip"
	$source_dir = "$base_dir\src"
	$test_dir = "$build_dir\test"
	$result_dir = "$build_dir\results"

	$build_dir = Split-Path $psake.build_script_file	
	$build_artifacts_dir = "$build_dir\..\BuildArtifacts\"
	$code_dir = "$build_dir\..\Code"
}

FormatTaskName (("-"*25) + "[{0}]" + ("-"*25))

Task Default -Depends Clean, Build

Task Build -Depends Clean {	
	Write-Host "Building CISample.sln" -ForegroundColor Green
	Exec { msbuild /t:Build /p:Configuration=Release /v:quiet /p:OutDir=$build_artifacts_dir $source_dir\$project_name.sln } 
}

Task Clean {
	Write-Host "Creating BuildArtifacts directory" -ForegroundColor Green
	if (Test-Path $build_artifacts_dir) 
	{	
		rd $build_artifacts_dir -rec -force | out-null
	}
	
	mkdir $build_artifacts_dir | out-null
	
	Write-Host "Cleaning $project_name.sln" -ForegroundColor Green
	Exec { msbuild /t:Clean /p:Configuration=Release /v:quiet $source_dir\$project_name.sln } 
}