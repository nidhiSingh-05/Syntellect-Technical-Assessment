package com;

import java.util.Arrays;
import java.util.Random;
import java.util.stream.IntStream;



public class HousieTicketProgram {

	private static CharSequence target;
	private static CharSequence replacement;

	public static void main(String[] args) {
		
		IntStream.range(0, 9).forEach(ValueBase ->{
			System.out.println("-----------------------------");
			startGame();
		});
	}

	private static void startGame() {
		
		int game[][] = new int [3][9];
		int limit =15;
		
		while(limit > 0)
		{
			int i = getRandomNumber(3);  // it will give no between 0 to 3
			int j = getRandomNumber(9);
//			System.out.println(i);
//			System.out.println(j);
			
			int data = validateAndReturnNumber(i,j,game);
			if(data > 0)
			{
				game[i][j] =data;
				limit--;
			}
		}
		System.out.println(Arrays.deepToString(game));
	}

	private static int validateAndReturnNumber(int i, int j, int[][] game) {
		if(game[i][j] != 0)
		{
			return -1;
		}
		int rowCount =0;
		for(int row=0;row<3;row++)
		{
			if(game[row][j] != 0)
			{
				rowCount++;
			}	
		}
		if(rowCount >= 2)
		{
			return -1;
		}
		int colCount =0;
		for(int col =0;col<9;col++)
		{
			if(game[i][col] != 0)
			{
				colCount++;
			}
		}
		if(colCount >= 5)
		{
			return -1;
		}
		int data =0;
		boolean isValue =false;
		do
		{
			data = getRandomNumberForCol(j);
			isValue = isValueExistsCol(game,i,j,data);
		}while(isValue);
		return data;
	}

	private static boolean isValueExistsCol(int[][] game, int i, int j, int data) {
		boolean ststus = false;
		for(int k=0;k<3;k++)
		{
			if(game[k][j] ==data)
			{
				ststus=true;
				break;
			}
		}
		return ststus;
	}

	private static int getRandomNumberForCol(int high) {
		if(high == 0)
		{
			high =10;
		}
		else
		{
			high =(high+1)*10;
		}
		int low = high -9;
		Random r = new Random();
		return r.nextInt(high-low)+low;

	}

	private static int getRandomNumber(int max) {
		
		return (int)(Math.random()*max);
	}
}
