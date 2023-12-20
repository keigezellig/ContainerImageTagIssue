#!/bin/sh

SINGLE_TAG=1.0.0
MULTIPLE_TAGS_WITH_SINGLE_QUOTE="'\"3.1.2;latest\"'"
MULTIPLE_TAGS_WITHOUT_SINGLE_QUOTE="\"3.1.2;latest\""
MULTIPLE_TAGS_WITH_SINGLE_QUOTE_WITH_VAR="'\"$SINGLE_TAG;latest\"'"
MULTIPLE_TAGS_WITHOUT_SINGLE_QUOTE_WITH_VAR="\"$SINGLE_TAG;latest\""

echo "************** Env var containing single tag ********************"
echo Tag: $SINGLE_TAG
echo
dotnet publish --os linux --arch x64 -p:PublishProfile=DefaultContainer -p ContainerRepository=ContainerImageTagIssue -p ContainerImageTags=$SINGLE_TAG -c Release
echo 
echo "*****************************************************************"
echo
echo "************** Env var containing multiple tags with single quote ********************"
echo Tag: $MULTIPLE_TAGS_WITHOUT_SINGLE_QUOTE
echo
dotnet publish --os linux --arch x64 -p:PublishProfile=DefaultContainer -p ContainerRepository=ContainerImageTagIssue -p ContainerImageTags=$MULTIPLE_TAGS_WITH_SINGLE_QUOTE -c Release
echo 
echo "**************************************************************************************"
echo
echo "************** Env var containing multiple tags without single quote ********************"
echo Tag: $MULTIPLE_TAGS_WITHOUT_SINGLE_QUOTE
echo
dotnet publish --os linux --arch x64 -p:PublishProfile=DefaultContainer -p ContainerRepository=ContainerImageTagIssue -p ContainerImageTags=\'$MULTIPLE_TAGS_WITHOUT_SINGLE_QUOTE\' -c Release
echo 
echo "*****************************************************************************************"
echo
echo "************** Env var containing multiple tags with one tag in another env var with single quote ********************"
echo Tag: $MULTIPLE_TAGS_WITH_SINGLE_QUOTE_WITH_VAR
echo
dotnet publish --os linux --arch x64 -p:PublishProfile=DefaultContainer -p ContainerRepository=ContainerImageTagIssue -p ContainerImageTags=$MULTIPLE_TAGS_WITH_SINGLE_QUOTE_WITH_VAR -c Release
echo 
echo "*****************************************************************************************"
echo
echo "************** Env var containing multiple tags without single quote ********************"
echo Tag: $MULTIPLE_TAGS_WITHOUT_SINGLE_QUOTE_WITH_VAR
echo
dotnet publish --os linux --arch x64 -p:PublishProfile=DefaultContainer -p ContainerRepository=ContainerImageTagIssue -p ContainerImageTags=\'$MULTIPLE_TAGS_WITHOUT_SINGLE_QUOTE_WITH_VAR\' -c Release
echo 
echo "*****************************************************************************************"
