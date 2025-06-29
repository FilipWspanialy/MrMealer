﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using MrMealer.Database;

#nullable disable

namespace MrMealer.Database.Migrations
{
    [DbContext(typeof(AppDbContext))]
    partial class AppDbContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder.HasAnnotation("ProductVersion", "9.0.5");

            modelBuilder.Entity("MrMealer.Database.Models.Day", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<DateTime?>("Date")
                        .HasColumnType("TEXT");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.ToTable("Days");
                });

            modelBuilder.Entity("MrMealer.Database.Models.Ingredient", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<bool>("Isbought")
                        .HasColumnType("INTEGER");

                    b.Property<string>("Measure")
                        .HasColumnType("TEXT");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("TEXT");

                    b.Property<int?>("RecipeForMealId")
                        .HasColumnType("INTEGER");

                    b.Property<int>("RecipeId")
                        .HasColumnType("INTEGER");

                    b.HasKey("Id");

                    b.HasIndex("RecipeForMealId");

                    b.HasIndex("RecipeId");

                    b.ToTable("Ingredients");
                });

            modelBuilder.Entity("MrMealer.Database.Models.IngredientFromApi", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.ToTable("IngredientsFromApi", (string)null);
                });

            modelBuilder.Entity("MrMealer.Database.Models.Meal", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<int>("DayId")
                        .HasColumnType("INTEGER");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.HasIndex("DayId");

                    b.ToTable("Meals");
                });

            modelBuilder.Entity("MrMealer.Database.Models.Recipe", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<string>("ImageUrl")
                        .HasColumnType("TEXT");

                    b.Property<string>("Instructions")
                        .IsRequired()
                        .HasColumnType("TEXT");

                    b.Property<bool>("IsUserCreated")
                        .HasColumnType("INTEGER");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.ToTable("Recipes");
                });

            modelBuilder.Entity("MrMealer.Database.Models.RecipeForMeal", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<int>("MealId")
                        .HasColumnType("INTEGER");

                    b.Property<int>("RecipeId")
                        .HasColumnType("INTEGER");

                    b.Property<string>("RecipeName")
                        .IsRequired()
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.HasIndex("MealId");

                    b.HasIndex("RecipeId");

                    b.ToTable("RecipeForMeals");
                });

            modelBuilder.Entity("MrMealer.Database.Models.Ingredient", b =>
                {
                    b.HasOne("MrMealer.Database.Models.RecipeForMeal", null)
                        .WithMany("Ingredients")
                        .HasForeignKey("RecipeForMealId");

                    b.HasOne("MrMealer.Database.Models.Recipe", "Recipe")
                        .WithMany("Ingredients")
                        .HasForeignKey("RecipeId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Recipe");
                });

            modelBuilder.Entity("MrMealer.Database.Models.Meal", b =>
                {
                    b.HasOne("MrMealer.Database.Models.Day", "Day")
                        .WithMany("Meals")
                        .HasForeignKey("DayId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Day");
                });

            modelBuilder.Entity("MrMealer.Database.Models.RecipeForMeal", b =>
                {
                    b.HasOne("MrMealer.Database.Models.Meal", "Meal")
                        .WithMany("Recipes")
                        .HasForeignKey("MealId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("MrMealer.Database.Models.Recipe", "Recipe")
                        .WithMany()
                        .HasForeignKey("RecipeId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Meal");

                    b.Navigation("Recipe");
                });

            modelBuilder.Entity("MrMealer.Database.Models.Day", b =>
                {
                    b.Navigation("Meals");
                });

            modelBuilder.Entity("MrMealer.Database.Models.Meal", b =>
                {
                    b.Navigation("Recipes");
                });

            modelBuilder.Entity("MrMealer.Database.Models.Recipe", b =>
                {
                    b.Navigation("Ingredients");
                });

            modelBuilder.Entity("MrMealer.Database.Models.RecipeForMeal", b =>
                {
                    b.Navigation("Ingredients");
                });
#pragma warning restore 612, 618
        }
    }
}
