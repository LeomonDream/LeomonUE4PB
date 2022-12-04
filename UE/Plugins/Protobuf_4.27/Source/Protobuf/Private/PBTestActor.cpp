// Fill out your copyright notice in the Description page of Project Settings.


#include "PBTestActor.h"

#include "MsgTestData.pb.h"


// Sets default values
APBTestActor::APBTestActor()
{
	// Set this actor to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;
}

// Called when the game starts or when spawned
void APBTestActor::BeginPlay()
{
	Super::BeginPlay();

	TSharedPtr<MsgTestData> TestData = MakeShared<MsgTestData>();
	TestData->set_index(1);
	TestData->set_value(999.0f);
	TestData->set_name("leo");


	TArray<uint8_t*> TestBytes;
	const int ByteSize = TestData->ByteSizeLong();
	TestBytes.SetNum(ByteSize);
	uint8_t* Buffer = reinterpret_cast<uint8_t*>(TestBytes.GetData());
	TestData->SerializeToArray(Buffer, ByteSize);

	
	TestData->ParseFromArray(Buffer, ByteSize);
	UE_LOG(LogTemp, Warning, TEXT("TestData index = %d"), TestData->index());
	UE_LOG(LogTemp, Warning, TEXT("TestData value = %f"), TestData->value());
	const FString NameStr (TestData->name().c_str());
	UE_LOG(LogTemp, Warning, TEXT("TestData name = %s"), *NameStr);
}

// Called every frame
void APBTestActor::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);
}

